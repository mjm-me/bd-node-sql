export const openConnection = async () => {
  const dataConnection = {
    host: process.env.DB_HOST || 'localhost',
    port: Number(process.env.DB_PORT) || 3306,
    user: process.env.DB_USERNAME,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_DATABASE || '',
  };
  const connection = await mysql.createConnection(dataConnection);
  console.log(
    'Connection to server:',
    connection.config.host,
    connection.config.port,
  );
  console.log(`Connection to DB:`, connection.config.database);
};
