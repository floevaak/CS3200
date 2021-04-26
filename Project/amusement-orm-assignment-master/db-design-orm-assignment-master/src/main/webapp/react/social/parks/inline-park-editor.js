const {useState, useEffect } = React;
const {Link} = window.ReactRouterDOM;

const InlineParkEditor = ({park, deletePark, updatePark}) => {
    const [parkCopy, setParkCopy] = useState(park)
    const [editing, setEditing] = useState(false)
    return(
        <div>
            {
                editing &&
                <div className="row">
                    <div className="col">
                        <input
                            className="form-control"
                            value={parkCopy.name}
                            onChange={(e)=>setParkCopy(parkCopy => ({...parkCopy, name: e.target.value}))}/>
                    </div>
                    <div className="col">
                        <input
                            className="form-control"
                            value={parkCopy.foodNum}
                            onChange={(e)=>setParkCopy(parkCopy => ({...parkCopy, foodNum: e.target.value}))}/>
                    </div>
                    <div className="col">
                        <input
                            className="form-control"
                            value={parkCopy.sizeSqm}
                            onChange={(e)=>setParkCopy(parkCopy => ({...parkCopy, sizeSqm: e.target.value}))}/>
                    </div>
                    <div className="col">
                        <input
                            className="form-control"
                            value={parkCopy.revenue}
                            onChange={(e)=>setParkCopy(parkCopy => ({...parkCopy, revenue: e.target.value}))}/>
                    </div>
                    <div className="col">
                        <input
                            className="form-control"
                            value={parkCopy.lights}
                            onChange={(e)=>setParkCopy(parkCopy => ({...parkCopy, lights: e.target.value}))}/>
                    </div>
                    {/*<div className="col-1">*/}
                    {/*    <Link to={`/parks/${parkCopy.id}/`}>*/}
                    {/*        Blogs*/}
                    {/*    </Link>*/}
                    {/*</div>*/}
                    <div className="col-2">
                        <i className="fas fa-2x fa-check float-right margin-left-10px"
                           onClick={() => {
                               setEditing(false)
                               updatePark(parkCopy.id, parkCopy)
                           }}></i>
                        <i className="fas fa-2x fa-undo float-right margin-left-10px"
                           onClick={() => setEditing(false)}></i>
                        <i className="fas fa-2x fa-trash float-right margin-left-10px"
                           onClick={() => deletePark(park.id)}></i>
                    </div>
                </div>
            }
            {
                !editing &&
                <div className="row">
                    <div className="col">
                        <Link to={`/parks/${parkCopy.id}`}>
                            {parkCopy.name}
                        </Link>
                    </div>
                    <div className="col">
                        <Link to={`/parks/${parkCopy.id}`}>
                            {parkCopy.foodNum}
                        </Link>
                    </div>
                    <div className="col">
                        <Link to={`/parks/${parkCopy.id}`}>
                            {parkCopy.sizeSqm}
                        </Link>
                    </div>
                    <div className="col">
                        <Link to={`/parks/${parkCopy.id}`}>
                            {parkCopy.revenue}
                        </Link>
                    </div>
                    <div className="col">
                        <Link to={`/parks/${parkCopy.id}`}>
                            {parkCopy.lights}
                        </Link>
                    </div>
                    <div className="col-2">
                        <i className="fas fa-cog fa-2x float-right"
                           onClick={() => setEditing(true)}></i>
                    </div>
                </div>
            }
        </div>
    )
}

export default InlineParkEditor;