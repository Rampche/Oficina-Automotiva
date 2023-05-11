import { Request, Response } from 'express';
import { remove, read } from '../../services/cars';

export default async (req: Request, res: Response) => {
  const { id } = req.params;

  if (!(await read(id))) {
    return res.status(404).json({
      code: 404,
      message: 'Car not found',
    });
  }

  await remove(id);
  return res.json();
};
