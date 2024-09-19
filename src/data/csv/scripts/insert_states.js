import fs from "fs";
import csv from "csv-parser";
import { conn } from "../../connection.js";

const filePath = './src/data/csv/states.csv';

async function insertDataFromCSV() {
  const data = [];

  // Lê o arquivo CSV e armazena os dados em um array
  fs.createReadStream(filePath)
    .pipe(csv({ separator: ';' }))
    .on('data', (row) => {
      data.push(row);
    })
    .on('end', async () => {
      try {
        // Insere os dados no banco de dados
        await conn('states').insert(data);
      } catch (error) {
        console.error('Erro ao inserir dados:', error);
      } finally {
        conn.destroy(); // Encerra a conexão com o banco de dados
      }
    });
}

insertDataFromCSV();
