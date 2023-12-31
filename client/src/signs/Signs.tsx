import { useEffect, useState } from 'react';
import Sheet from '@mui/joy/Sheet';
import Stack from '@mui/joy/Stack';
import { styled } from '@mui/joy/styles';

const Item = styled(Sheet)(({ theme }) => ({
    ...theme.typography.body2,
    padding: theme.spacing(1),
    textAlign: 'center',
    color: theme.vars.palette.text.tertiary,
}))

type Sign = {
    name: string;
    modality: string;
    element: string;
};

type SignsResponse = Sign[];

function renderSigns(signs: SignsResponse) {
    return (
        <>            {
            signs.map((sign: Sign) => {
                return (
                    <Stack
                        direction="row"
                        spacing={2}
                        justifyContent="center"
                        sx={{ width: '100%' }}
                        key={sign.name}
                    >
                        <Item>{sign.name.toUpperCase()}</Item>
                        <Item>{sign.modality}</Item>
                        <Item>{sign.element}</Item>
                    </Stack>
                )
            })
        }
        </>
    )
}

function Signs() {
    const [error, setError] = useState(null);
    const [isLoaded, setIsLoaded] = useState(false);
    const [signs, setSigns] = useState<SignsResponse>([]);

    useEffect(() => {
        fetch("http://localhost:3000/api/v1/signs")
            .then(res => res.json())
            .then(
                (data) => {
                    setIsLoaded(true);
                    setSigns(data?.signs);
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
        return (
            <>
                {renderSigns(signs)}
            </>
        );
    };
};

export default Signs;