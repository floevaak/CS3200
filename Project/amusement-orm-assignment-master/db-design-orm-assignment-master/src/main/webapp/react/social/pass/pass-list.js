const {Link, useHistory} = window.ReactRouterDOM;

import passService from "./pass-service"
const { useState, useEffect } = React;
const PassList = () => {
    const history = useHistory()
    const [passes, setPass] = useState([])
    useEffect(() => {
        findAllPasses()
    }, [])
    const findAllPasses = () =>
        passService.findAllPasses()
            .then(pass => setPass(pass))
    return(

        /*
        `id` INT NOT NULL AUTO_INCREMENT,
                                             `price` INT NOT NULL,
                                             `start_date` DATE NULL,
                                             `end_date` DATE NULL,
                                             `food_pack` BIT NOT NULL,
                                             `fast_pass` BIT NOT NULL,
        */

        <div>
            <h2>Admission Passes</h2>
            <button onClick={() => history.push("/passes/new")}>
                Add Pass
            </button>
            <ul className="list-group">
                {
                    passes.map(pass =>
                        <li className="list-group-item" key={pass.id}>
                            <Link to={`/passes/${pass.id}`}>
                                {pass.description},
                                Price: {pass.price},
                                Start Date: {pass.startDate},
                                End Date: {pass.endDate},
                                {pass.foodPack? "Include Food Pack": ""},
                                {pass.fastPass? "Include Fast Pass": ""}
                            </Link>
                        </li>)
                }
            </ul>
        </div>
    )
}

export default PassList;