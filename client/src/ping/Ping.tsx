import { useEffect, useState } from 'react';

function Ping() {
    const [error, setError] = useState(null);
    const [isLoaded, setIsLoaded] = useState(false);
    const [pong, setPong] = useState('');

    useEffect(() => {
        fetch("http://localhost:5000/ping")
            .then(res => res.json())
            .then(
                (data) => {
                    setIsLoaded(true);
                    setPong(data);
                },
                (error) => {
                    setIsLoaded(true);
                    setError(error)
                }
            )
    }, []);

    if (error) {
        return (<>Error: {error}</>);
    };

    if (!isLoaded) {
        return (<>Loading...</>);
    } else {
        return (<>{pong}</>);
    };
};

export default Ping;