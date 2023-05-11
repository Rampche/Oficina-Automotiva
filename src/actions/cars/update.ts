import { Request, Response } from 'express';
import { update, read } from '../../services/cars';

export default async (req: Request, res: Response) => {
  const { car_id } = req.params;

  if (!(await read(car_id))) {
    return res.status(404).json({
      code: 404,
      message: 'Car not found',
    });
  }

  const car = await update(car_id, req.body);
  return res.json(car);
};
