import React from 'react';
import { rest } from 'msw';
import { setupServer } from 'msw/node';
import { render, screen, waitFor } from '@testing-library/react';
import '@testing-library/jest-dom';
import HelloWorld from './HelloWorld';


const server = setupServer(
    rest.get('/test', (req, res, ctx) => {
        return res(
            ctx.status(200),
            ctx.json({ result: 'Hello, world! Let the cosmos pair' }),
        )
    }),
)

describe('HelloWorld', () => {
    beforeAll(() => server.listen({ onUnhandledRequest: "bypass" }));
    afterEach(() => server.resetHandlers());
    afterAll(() => server.close());

    it('renders hello world message', async () => {
        render(<HelloWorld />);
        // not resolving for some reason
        await waitFor(() => {
            screen.getByTestId('hello');
        });
        expect(screen.getByTestId('hello')).toHaveTextContent(/Hello, world! Let the cosmos pair/i);
    });
});