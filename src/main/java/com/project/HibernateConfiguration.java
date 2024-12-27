package com.project;

import java.util.Properties;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@EnableTransactionManagement  // Enable transaction management for this configuration class
public class HibernateConfiguration {

    // Injecting database connection properties from application.properties or application.yml
    @Value("${db.driver}")
    private String driver;

    @Value("${db.password}")
    private String password;

    @Value("${db.url}")
    private String url;

    @Value("${db.username}")
    private String userName;

    @Value("${hibernate.dialect}")
    private String dialect;

    @Value("${hibernate.show_sql}")
    private String showSql;

    @Value("${hibernate.hbm2ddl.auto}")
    private String hbm2ddlAuto;

    @Value("${entitymanager.packagesToScan}")
    private String packagesToScan;

    /**
     * Creates and configures a DataSource bean for connecting to the database.
     *
     * @return DataSource - The DataSource bean configured for database connection
     */
    @Bean
    public DataSource dataSource() {
        // Initialize the DriverManagerDataSource, a standard DataSource implementation
        DriverManagerDataSource dataSource = new DriverManagerDataSource();

        // Set the database driver class, URL, username, and password
        dataSource.setDriverClassName(driver);
        dataSource.setUrl(url);
        dataSource.setUsername(userName);
        dataSource.setPassword(password);

        return dataSource;
    }

    /**
     * Creates and configures a SessionFactory bean for Hibernate.
     * The SessionFactory is used for interacting with Hibernate ORM.
     *
     * @return LocalSessionFactoryBean - The SessionFactory bean configured for Hibernate
     */
    @Bean
    public LocalSessionFactoryBean sessionFactory() {
        LocalSessionFactoryBean sessionFactory = new LocalSessionFactoryBean();

        // Set the dataSource for the sessionFactory
        sessionFactory.setDataSource(dataSource());

        // Set the package(s) to scan for entity classes
        sessionFactory.setPackagesToScan(packagesToScan);

        // Configure Hibernate properties
        Properties hibernateProperties = new Properties();
        hibernateProperties.put("hibernate.dialect", dialect);  // Specify the Hibernate dialect (e.g., MySQL)
        hibernateProperties.put("hibernate.show_sql", showSql);  // Whether or not to show SQL in the console
        hibernateProperties.put("hibernate.hbm2ddl.auto", hbm2ddlAuto);  // DDL generation strategy (e.g., update, create)

        // Set the Hibernate properties on the sessionFactory
        sessionFactory.setHibernateProperties(hibernateProperties);

        return sessionFactory;
    }

    /**
     * Creates and configures a TransactionManager bean for managing transactions in Hibernate.
     *
     * @return HibernateTransactionManager - The transaction manager for Hibernate
     */
    @Bean
    public HibernateTransactionManager transactionManager() {
        HibernateTransactionManager transactionManager = new HibernateTransactionManager();

        // Set the sessionFactory for the transaction manager
        transactionManager.setSessionFactory(sessionFactory().getObject());

        return transactionManager;
    }
}
