// declare URL where server listens for HTTP requests, how to fix CORS filter error?
const PASSES_URL = "http://localhost:8080/api/passes"

// TODO: retrieve all passes from the server
export const findAllPasses = () =>
    fetch(PASSES_URL)
        .then(response => response.json())


// TODO: retrieve a single pass by their ID
export const findPassById = (id) =>
    fetch(`${PASSES_URL}/${id}`)
        .then(response => response.json())


// TODO: delete a pass by their ID
export const deletePass = (id) =>
    fetch(`${PASSES_URL}/${id}`, {
        method: "DELETE"
    })

// TODO: create a new pass
export const createPass = (pass) =>
    fetch(PASSES_URL, {
        method: 'POST',
        body: JSON.stringify(pass),
        headers: {'content-type': 'application/json'}
    })
        .then(response => response.json())

// TODO: update a pass by their ID
export const updatePass = (id, pass) =>
    fetch(`${PASSES_URL}/${id}`, {
        method: 'PUT',
        body: JSON.stringify(pass),
        headers: {'content-type': 'application/json'}
    })
        .then(response => response.json())

// TODO: export all functions as the API to this service
export default {
    findAllPasses,
    findPassById,
    deletePass,
    createPass,
    updatePass
}
