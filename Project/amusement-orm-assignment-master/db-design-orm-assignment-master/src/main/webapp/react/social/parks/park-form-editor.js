import parkService from "./park-service"

const {useState, useEffect} = React;
const {Link, useParams, useHistory} = window.ReactRouterDOM;
const ParkFormEditor = () => {
    const {id} = useParams()
    const [park, setPark] = useState({})
    const findParkById = (id) =>
        parkService.findParkById(id)
            .then(park => setPark(park))
    const deletePark = (id) =>
        parkService.deletePark(id)
            .then(() => history.goBack())
    useEffect(() => {
        if (id !== "new") {
            findParkById(id)
        }
    }, []);
    const createPark = (park) =>
        parkService.createPark(park)
            .then(() => history.goBack())
    const updatePark = (id, newPark) =>
        parkService.updatePark(id, newPark)
            .then(() => history.goBack())
    const history = useHistory()
    return (
        <div>
            <h2>Park Editor</h2>
            <Link to={`/passes/`}>
                Link to Passes
            </Link><br/>
            <label>ID</label>
            <input className = "form-control" value={park.id}/><br/>
            <label>Name</label>
            <input
                className = "form-control"
                onChange={(e) =>
                    setPark(park =>
                        ({...park, name: e.target.value}))}
                value={park.name}/>
            <br/>
            <label>Number of Food Stands</label>
            <input
                className = "form-control"
                onChange={(e) =>
                    setPark(park =>
                        ({...park, foodNum: e.target.value}))}
                value={park.foodNum}/>
            <br/>
            <label>Size in Square Meters</label>
            <input
                className = "form-control"
                onChange={(e) =>
                    setPark(park =>
                        ({...park, sizeSqm: e.target.value}))}
                value={park.sizeSqm}/>
            <br/>
            <label>Revenue</label>
            <input
                className = "form-control"
                onChange={(e) =>
                    setPark(park =>
                        ({...park, revenue: e.target.value}))}
                value={park.revenue}/>
            <br/>
            <label>Lights</label>
            <input
                className = "form-control"
                onChange={(e) =>
                    setPark(park =>
                        ({...park, lights: e.target.value}))}
                value={park.lights}/>
            <br/>
            <button
                onClick={() => {
                    history.goBack()
                }}>
                Cancel
            </button>
            <button
                onClick={() => deletePark(park.id)}>
                Delete
            </button>
            <button
                onClick={() => createPark(park)}>
                Create
            </button>
            <button
                onClick={() => updatePark(park.id, park)}>
                Save
            </button>
        </div>
    )
}

export default ParkFormEditor