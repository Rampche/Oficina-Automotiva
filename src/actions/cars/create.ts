import { Request, Response, response } from 'express';
import { create } from '../../services/cars';
import { Car } from '../../models/car';

export default async (req: Request, res: Response) => {
  const { brand, model, color }: Car = req.body;

  const newCar = await create({ brand, model, color });

  return res.json(newCar);
};
