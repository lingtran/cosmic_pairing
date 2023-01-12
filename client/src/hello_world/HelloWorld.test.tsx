import React from 'react';
import { render, screen, waitFor } from '@testing-library/react';
import '@testing-library/jest-dom';
import { rest } from 'msw';
import { setupServer } from 'msw/node';
import HelloWorld from './HelloWorld';


const server = setupServer(
    rest.get('/test', (req, res, ctx) => {
        return res(ctx.json({ result: 'Hello, world! Let the cosmos pair' }))
    }),
)

describe('HelloWorld', () => {
    beforeAll(() => server.listen());
    afterEach(() => server.resetHandlers());
    afterAll(() => server.close());

    it('renders hello world message', async () => {
        render(<HelloWorld />);
        await waitFor(() => {
            expect(screen.getByTestId('hello')).toHaveTextContent(/Hello, world! Let the cosmos pair/i);
        })
    });
});