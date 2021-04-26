// declare URL where server listens for HTTP requests, how to fix CORS filter error?
const PASSES_URL = "http://localhost:8080/orm/passes"

// retrieve all passes from the server
export const findAllPasses = () =>
    fetch(PASSES_URL)
        .then(response => response.json())


// retrieve a single pass by their ID
export const findPassById = (id) =>
    fetch(`${PASSES_URL}/${id}`)
        .then(response => response.json())


// delete a pass by their ID
export const deletePass = (id) =>
    fetch(`${PASSES_URL}/${id}`, {
        method: "DELETE"
    })

//  create a new pass
export const createPass = (pass) =>
    fetch(PASSES_URL, {
        method: 'POST',
        body: JSON.stringify(pass),
        headers: {'content-type': 'application/json'}
    })
        .then(response => response.json())

// update a pass by their ID
export const updatePass = (id, pass) =>
    fetch(`${PASSES_URL}/update/${id}`, {
        method: 'POST',
        body: JSON.stringify(pass),
        headers: {'content-type': 'application/json'}
    })
        .then(response => response.json())

// export all functions as the API to this service
export default {
    findAllPasses,
    findPassById,
    deletePass,
    createPass,
    updatePass
}
