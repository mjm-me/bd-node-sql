import type { Connection, ResultSetHeader } from 'mysql2/promise';
import type { Genere, GenereRow } from './entities';

export class ManageGeneres {
    constructor(private connection: Connection) {}

    async getAllGeneres(): Promise<Genere[]> {
        const q = 'select genere_id as id, name from generes';
        const [rows] = await this.connection.query<GenereRow[]>(q);
        return rows;
    }

    async getGenereById(id: number): Promise<Genere> {
        const q = `select genere_id as id, name from generes where genere_id = ?`;
        const [rows] = await this.connection.query<GenereRow[]>(q, [id]);

        if (rows.length === 0) {
            throw new Error(`Genere with id ${id} not found`);
        }

        return rows[0];
    }

    async createGenere(name: string): Promise<Genere> {
        const q = `insert into generes (name) VALUES (?);`;
        const [result] = await this.connection.query<ResultSetHeader>(q, [
            name,
        ]);

        if (result.affectedRows === 1) {
            console.log('Genere created with id:', result.insertId);
            return this.getGenereById(result.insertId);
        }

        throw new Error('Genere not created');
    }

    async updateGenere(id: number, name: string): Promise<Genere> {
        const q = `update generes set name = ? where genere_id = ?;`;
        const [result] = await this.connection.query<ResultSetHeader>(q, [
            name,
            id,
        ]);

        if (result.affectedRows === 1) {
            console.log('Genere updated with id:', id);
            return this.getGenereById(id);
        }

        throw new Error('Genere not updated');
    }

    async deleteGenere(id: number): Promise<Genere> {
        const genereForDelete = await this.getGenereById(id);

        const q = `delete from generes where genere_id = ?;`;
        const [result] = await this.connection.query<ResultSetHeader>(q, [id]);

        if (result.affectedRows === 1) {
            console.log('Genere deleted with id:', id);
            return genereForDelete;
        }

        throw new Error('Genere not deleted');
    }
}