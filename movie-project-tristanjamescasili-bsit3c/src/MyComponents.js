// Correct usage
const MyComponent = () => {
    const [state, setState] = useState(false);
    return <div>{state.toString()}</div>;
};

// Incorrect usage
if (true) {
    const [state, setState] = useState(false); // Will throw an error
}
