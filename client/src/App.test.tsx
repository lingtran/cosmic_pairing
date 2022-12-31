import React from 'react';
import { render, screen } from '@testing-library/react';
import App from './App';

describe('App', () => {
  it('renders header', () => {
    render(<App />);
    const headerText = screen.getByText(/Cosmic Pairing/i);
    expect(headerText).toBeInTheDocument();
  });
});
