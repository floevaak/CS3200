import passService from "./pass-service"

const {useState, useEffect} = React;
const {useParams, useHistory} = window.ReactRouterDOM;
const PassFormEditor = () => {
    const {id} = useParams()
    const [pass, setPass] = useState({})
    const findPassById = (id) =>
        passService.findPassById(id)
            .then(pass => setPass(pass))
    const deletePass = (id) =>
        passService.deletePass(id)
            .then(() => history.goBack())
    useEffect(() => {
        if (id !== "new") {
            findPassById(id)
        }
    }, []);
    const createPass = (pass) =>
        passService.createPass(pass)
            .then(() => history.goBack())
    const updatePass = (id, newPass) =>
        passService.updatePass(id, newPass)
            .then(() => history.goBack())
    const history = useHistory()
    return (
        <div>
            <h2>Pass Editor</h2>
            <label>ID</label>
            <input className = "form-control" value={pass.id}/><br/>


            <label>Description</label>
            <input
                className = "form-control"
                onChange={(e) =>
                    setPass(pass =>
                        ({...pass, name: e.target.value}))}
                value={pass.description}/>
            <br/>

            <label>Start Date</label>
            <input
                className = "form-control"
                onChange={(e) =>
                    setPass(pass =>
                        ({...pass, startDate: e.target.value}))}
                value={pass.startDate}/>
            <br/>
            <label>End Date</label>
            <input
                className = "form-control"
                onChange={(e) =>
                    setPass(pass =>
                        ({...pass, endDate: e.target.value}))}
                value={pass.endDate}/>
            <br/>

            <label>Price</label>
            <input
                className = "form-control"
                onChange={(e) =>
                    setPass(pass =>
                        ({...pass, price: e.target.value}))}
                value={pass.price}/>
            <br/>

            <label>Food Pack</label>
            <checkbox
                className = "form-control"
                onChange={(e) =>
                    setPass(pass =>
                        ({...pass, foodPack: e.target.value}))}
                value={pass.foodPack}/>
            <br/>

            <label>Fast Pass</label>
            <checkbox
                className = "form-control"
                onChange={(e) =>
                    setPass(pass =>
                        ({...pass, fastPass: e.target.value}))}
                value={pass.fastPass}/>
            <br/>

            <button
                onClick={() => {
                    history.goBack()
                }}>
                Cancel
            </button>
            <button
                onClick={() => deletePass(pass.id)}>
                Delete
            </button>
            <button
                onClick={() => createPass(pass)}>
                Create
            </button>
            <button
                onClick={() => updatePass(pass.id, pass)}>
                Save
            </button>
        </div>
    )
}

export default PassFormEditor