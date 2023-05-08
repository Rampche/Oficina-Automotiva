import { Request, Response } from 'express';
import { list } from '../../services/orders';

export default async (req: Request, res: Response) => {
  res.json(await list());
};
