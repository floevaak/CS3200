const PARKS_URL = "http://localhost:8080/api/parks"

// retrieve all parks from the server
export const findAllParks = () =>
    fetch(PARKS_URL)
        .then(response => response.json())


// retrieve a single park by their ID
export const findParkById = (id) =>
    fetch(`${PARKS_URL}/${id}`)
        .then(response => response.json())


// delete a park by their ID
export const deletePark = (id) =>
    fetch(`${PARKS_URL}/${id}`, {
        method: "DELETE"
    })

// create a new park
export const createPark = (park) =>
    fetch(PARKS_URL, {
        method: 'POST',
        body: JSON.stringify(park),
        headers: {'content-type': 'application/json'}
    })
        .then(response => response.json())

// update a park by their ID
export const updatePark = (id, park) =>
    fetch(`${PARKS_URL}/${id}`, {
        method: 'PUT',
        body: JSON.stringify(park),
        headers: {'content-type': 'application/json'}
    })
        .then(response => response.json())

// export all functions as the API to this service
export default {
    findAllParks,
    findParkById,
    deletePark,
    createPark,
    updatePark
}
