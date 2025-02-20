import type { Connection, ResultSetHeader } from 'mysql2/promise';
import type { Generes } from './entities';
import type { Movies } from './films';

export class ManageMovies {
  constructor(private connection: Connection) {}

  getAllMovies = async () => {
    const q = 'select movie_id as id, title from movies';
    const [rows] = await this.connection.query<Movies[]>(q);
    return rows;
  };

  getMovieById = async (id: number) => {
    const q = `select genere_id as id, name from generes where genere_id = ?`;
    const [rows] = await this.connection.query<Movies[]>(q, [id]);
    return rows;
  };

  createMovie = async (name: string) => {
    const q = `insert into generes (name) VALUES (?);`;
    const [result] = await this.connection.query<ResultSetHeader>(q, [name]);

    if (result.affectedRows === 1) {
      console.log('Genere created with id:', result.insertId);
      return this.getMovieById(result.insertId);
    }

    return result;
  };

  updateMovie = async (id: number, name: string) => {
    const q = `update generes set name = ? where genere_id = ?;`;
    const [result] = await this.connection.query<ResultSetHeader>(q, [
      name,
      id,
    ]);

    if (result.affectedRows === 1) {
      console.log('Genere updated with id:', id);
      return this.getMovieById(id);
    }

    return result;
  };

  deleteGenere = async (id: number) => {
    const genereForDelete = await this.getMovieById(id);

    const q = `delete from movies where genere_id = ?;`;
    const [result] = await this.connection.query<ResultSetHeader>(q, [id]);

    if (result.affectedRows === 1) {
      console.log('Movie deleted with id:', id);
      return genereForDelete;
    }

    return result;
  };
}
