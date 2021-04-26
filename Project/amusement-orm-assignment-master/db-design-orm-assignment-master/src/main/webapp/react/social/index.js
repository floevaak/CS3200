import UserList from "./users/user-list";
import UserFormEditor from "./users/user-form-editor";

import PassList from "./pass/pass-list";
import PassFormEditor from "./pass/pass-form-editor";
import ParkList from "./parks/park-list";

import ParkFormEditor from "./parks/park-form-editor";

const {HashRouter, Route} = window.ReactRouterDOM;
const App = () => {
    return (
        <div className="container-fluid">
            <HashRouter>
                <Route path={["/users", "/"]} exact={true}>
                    <UserList/>
                </Route>
                <Route path="/users/:id" exact={true}>
                    <UserFormEditor/>
                </Route>

                <Route path={["/passes", "/"]} exact={true}>
                    <PassList/>
                </Route>
                <Route path="/passes/:id" exact={true}>
                    <PassFormEditor/>
                </Route>

                <Route path={["/parks", "/"]} exact={true}>
                    <ParkList/>
                </Route>
                <Route path="/parks/:id" exact={true}>
                    <ParkFormEditor/>
                </Route>
            </HashRouter>
        </div>
    );
}

export default App;
