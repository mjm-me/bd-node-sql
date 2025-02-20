import type { RowDataPacket } from 'mysql2/promise';

// interface Category extends mysql.RowDataPacket {
//     id: number;
//     name: string;
// };

export type Movies = {
  id: number;
  title: string;
  release_year: number;
} & RowDataPacket;
