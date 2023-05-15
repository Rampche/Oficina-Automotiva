import { Request, Response } from 'express';
import { register } from '../../services/auth';

export default async (request: Request, response: Response) => {
  try {
    const { email, password, fullName } = request.body;

    const user = await register(email, password, fullName);

    return response.json({ user });
  } catch (e: any) {
    return response.status(400).json({
      code: 400,
      error: 'Bad Request',
      message: e.message,
    });
  }
};
