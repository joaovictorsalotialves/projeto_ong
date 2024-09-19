import fs from "fs";
import csv from "csv-parser";
import { conn } from "../../connection.js";

const filePath = './src/data/csv/cities.csv';

async function insertDataFromCSV() {
  const data = [];

  fs.createReadStream(filePath)
    .pipe(csv({ separator: ';' }))
    .on('data', (row) => {
      data.push(row);
    })
    .on('end', async () => {
      try {
        await conn('cities').insert(data);
      } catch (error) {
        console.error('Erro ao inserir dados:', error);
      } finally {
        conn.destroy();
      }
    });
}

insertDataFromCSV();
