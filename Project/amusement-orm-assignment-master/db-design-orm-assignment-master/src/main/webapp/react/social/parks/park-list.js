const {Link, useHistory} = window.ReactRouterDOM;

import parkService from "./park-service"
const { useState, useEffect } = React;
const ParkList = () => {
    const history = useHistory()
    const [parks, setParks] = useState([])
    useEffect(() => {
        findAllParks()
    }, [])
    const findAllParks = () =>
        parkService.findAllParks()
            .then(parks => setParks(parks))
    return(
        <div>
            <h2>Parks</h2>
            <button onClick={() => history.push("/parks/new")}>
                Add Park
            </button>
            <ul className="list-group">
                {
                    parks.map(park =>
                        <li className="list-group-item" key={park.id}>
                            <Link to={`/parks/${park.id}`}>
                                {park.name}
                            </Link>
                        </li>)
                }
            </ul>
        </div>
    )
}

export default ParkList;