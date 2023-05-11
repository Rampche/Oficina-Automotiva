import { Request, Response } from 'express';
import { read } from '../../services/cars';

export default async (req: Request, res: Response) => {
  const { car_id } = req.params;

  const car = await read(car_id);

  if (!car) {
    return res.status(404).json({
      code: 404,
      message: 'Car not found',
    });
  }

  return res.json(car);
};
