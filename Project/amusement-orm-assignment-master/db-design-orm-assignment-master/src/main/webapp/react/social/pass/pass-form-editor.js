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
                        ({...pass, description: e.target.value}))}
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
            <input type="number"
                className = "form-control"
                onChange={(e) =>
                    setPass(pass =>
                        ({...pass, price: e.target.value}))}
                value={pass.price}/>
            <br/>

            <label>Food Pack </label>
            <input type="checkbox" name = "foodPack"
                checked={pass.foodPack}
                onChange={(e) =>
                    setPass(pass =>
                        ({...pass, foodPack: e.target.checked}))}
                   value={pass.foodPack}/>
            <br/>

            <label>Fast Pass </label>
            <input type="checkbox" name="fastPass"
                   checked={pass.fastPass}
                onChange={(e) =>
                    setPass(pass =>
                        ({...pass, fastPass: e.target.checked}))}
                   value={pass.fastPass}/>
            <br/>
            {/*todo, map it to park*/}
            <label>Park ID </label>
            <input type="number" name="parkId"
                   checked={pass.parkId}
                   onChange={(e) =>
                       setPass(pass =>
                           ({...pass, parkId: e.target.value}))}
                   value={pass.parkId}/>
            <br/>
            {/*todo, map it to user*/}
            <label>User ID </label>
            <input type="number" name="userId"
                   checked={pass.userId}
                   onChange={(e) =>
                       setPass(pass =>
                           ({...pass, userId: e.target.value}))}
                   value={pass.userId}/>
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