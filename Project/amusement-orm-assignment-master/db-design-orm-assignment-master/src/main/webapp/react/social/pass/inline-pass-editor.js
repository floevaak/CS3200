const {useState, useEffect } = React;
const {Link} = window.ReactRouterDOM;

const InlinePassEditor = ({pass, deletePass, updatePass}) => {
    const [passCopy, setPassCopy] = useState(pass)
    const [editing, setEditing] = useState(false)
    return(
        <div>
            {
                editing &&
                <div className="row">
                    <div className="col">
                        <input
                            className="form-control"
                            value={passCopy.description}
                            onChange={(e)=>setPassCopy(passCopy => ({...passCopy, description: e.target.value}))}/>
                    </div>
                    <div className="col">
                        <input type="number"
                            className="form-control"
                            value={passCopy.price}
                            onChange={(e)=>setPassCopy(passCopy => ({...passCopy, price: e.target.value}))}/>
                    </div>
                    <div className="col">
                        <input type="checkbox"
                            className="form-control"
                            value={passCopy.fastPass}
                            onChange={(e)=>setPassCopy(passCopy => ({...passCopy, fastPass: e.target.value}))}/>
                    </div>
                    <div className="col">
                        <input type="checkbox"
                               className="form-control"
                               value={passCopy.foodPack}
                               onChange={(e)=>setPassCopy(passCopy => ({...passCopy, foodPack: e.target.value}))}/>
                    </div>
                    {/*<div className="col-1">*/}
                    {/*    <Link to={`/pass/${passCopy.id}/`}>*/}
                    {/*        Blogs*/}
                    {/*    </Link>*/}
                    {/*</div>*/}
                    <div className="col-2">
                        <i className="fas fa-2x fa-check float-right margin-left-10px"
                           onClick={() => {
                               setEditing(false)
                               updatePass(passCopy.id, passCopy)
                           }}></i>
                        <i className="fas fa-2x fa-undo float-right margin-left-10px"
                           onClick={() => setEditing(false)}></i>
                        <i className="fas fa-2x fa-trash float-right margin-left-10px"
                           onClick={() => deletePass(pass.id)}></i>
                    </div>
                </div>
            }
            {
                !editing &&
                <div className="row">
                    <div className="col">
                        <Link to={`/pass/${passCopy.id}`}>
                            {passCopy.description}
                        </Link>
                    </div>
                    <div className="col">
                        <Link to={`/pass/${passCopy.id}`}>
                            {passCopy.startDate}
                        </Link>
                    </div>
                    <div className="col">
                        <Link to={`/pass/${passCopy.id}`}>
                            {passCopy.endDate}
                        </Link>
                    </div>
                    <div className="col">
                        <Link to={`/pass/${passCopy.id}`}>
                            {passCopy.price}
                        </Link>
                    </div>

                    <div className="col">
                        <Link to={`/pass/${passCopy.id}`}>
                            {passCopy.fastPass}
                        </Link>
                    </div>
                    <div className="col">
                        <Link to={`/pass/${passCopy.id}`}>
                            {passCopy.foodPack}
                        </Link>
                    </div>
                    {/*<div className="col-1">*/}
                    {/*    <Link to={`/passs/${passCopy.id}/`}>*/}
                    {/*        Blogs*/}
                    {/*    </Link>*/}
                    {/*</div>*/}
                    <div className="col-2">
                        <i className="fas fa-cog fa-2x float-right"
                           onClick={() => setEditing(true)}></i>
                    </div>
                </div>
            }
        </div>
    )
}

export default InlinePassEditor;