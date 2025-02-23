import mysql from 'mysql2/promise';

export const openConnection = async () => {
    const dataConnection = {
        host: process.env.DB_HOST || 'localhost',
        port: Number(process.env.DB_PORT) || 3306,
        user: process.env.DB_USER,
        password: process.env.DB_PASSWD,
        database: process.env.DB_NAME || '',
    };
    const connection = await mysql.createConnection(dataConnection);
    console.log(
        'Connection to server:',
        connection.config.host,
        connection.config.port,
    );
    console.log('Connection to DB:', connection.config.database);
    return connection;
};
