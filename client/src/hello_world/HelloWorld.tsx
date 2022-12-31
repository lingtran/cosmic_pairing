import { useEffect, useState } from 'react';

function HelloWorld() {
    const [error, setError] = useState(null);
    const [isLoaded, setIsLoaded] = useState(false);
    const [hello, setHello] = useState('');

    useEffect(() => {
        fetch("http://localhost:5000/test")
            .then(res => res.json())
            .then(
                (data) => {
                    setIsLoaded(true);
                    setHello(data?.result);
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
        return (<>{hello}</>);
    };
};

export default HelloWorld;