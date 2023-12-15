import { Body, Controller, Get, Post, Render, Res } from '@nestjs/common';
import * as mysql from 'mysql2';
import { AppService } from './app.service';
import { newCouponDTO } from './newCouponDTO';
import e, { Response } from 'express';

const conn = mysql.createPool({
  host: process.env.DB_HOST || 'localhost',
  port: parseInt(process.env.DB_PORT) || 3306,
  user: process.env.DB_USERNAME || 'root',
  password: process.env.DB_PASSWORD || '',
  database: process.env.DB_DATABASE || 'szinhaz',
}).promise();

@Controller()
export class AppController {
  constructor(private readonly appService: AppService) {}

  @Get()
  @Render('index')
  async index() {
    const [ kuponok ] = await conn.execute('SELECT id, title, percentage, code FROM eloadas ORDER BY title');
    return {
       cupons: kuponok, 
      };
  }


  @Get('/newCoupon')
  @Render('newCoupon')
  newCoupon() {
    return { hibaUzenet: '' };
  }

  @Post('/newCoupon')
  @Render('newCoupon')
  async addNewMusic(@Body() newCoupon: newCouponDTO, @Res() res: Response) {
      const title = newCoupon.title;
      const percentage = newCoupon.percentage;
      const code = newCoupon.code;
      const mintaCode: RegExp = /^[A-Z]{4}-\d{6}$/;
      if(title.trim() == "" || percentage.toString().trim() == "" || code.trim() == "") {
        return { hibaUzenet: "Ki kell tölteni minden mezőt!"};
      } else if (title.length < 1){
        return { hibaUzenet: "A címnek legalább egy karakter hosszúnak kell lennie!"};
      } else if (!(percentage >= 1 && percentage <= 99)){
        return { hibaUzenet: "A százaléknak 1 és 99 között kell lennie!"};
      } else if (mintaCode.test(code) == false){
        return { hibaUzenet: "Hibás formátumban adtad meg a kódot!"};
      } else {
        const [ kuponok ] = await conn.execute('INSERT INTO eloadas (title, percentage, code) VALUES (?, ?, ?)', [ 
          title,
          percentage,
          code,
        ],
        );
        res.redirect('/');
      }
    }
}
