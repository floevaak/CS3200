const {Link, useHistory} = window.ReactRouterDOM;

import passService from "./pass-service"
const { useState, useEffect } = React;
const PassList = () => {
    const history = useHistory()
    const [pass, setPass] = useState([])
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
            <h2>Pass</h2>
            <button onClick={() => history.push("/pass/new")}>
                Add Pass
            </button>
            <ul className="list-group">
                {
                    pass.map(pass =>
                        <li class="list-group-item" key={pass.id}>
                            <Link to={`/pass/${pass.id}`}>
                                {pass.id},
                                {pass.description},
                                {pass.price},
                                {pass.startDate},
                                {pass.endDate},
                                {pass.foodPack},
                                {pass.fastPass}

                            </Link>
                        </li>)
                }
            </ul>
        </div>
    )
}

export default PassList;