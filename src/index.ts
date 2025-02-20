import { loadEnvFile } from 'node:process';
import mysql from 'mysql2/promise';

loadEnvFile('.env');

interface Category extends mysql.RowDataPacket {
  id: number;
  name: string;
}

try {
} catch (error) {
  if (error instanceof Error) {
    console.error(error);
  } else {
    console.error(error);
  }
}

const getAllGeneres = async () => {
  const connection = await openConnection();
  const q = 'select genere_id as id, name from generes';
  const [rows] = await connection.query<Category[]>(q);
  console.log(rows);
  return connection;
};
