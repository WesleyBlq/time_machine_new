
const calendar = (state = {}, action) => {
    // console.log("enter reducer func");
    switch (action.type) {
        case 'NEW_TIME':
            return {
                ...state,
                time: action.time,
            }
        default:
            return state
    }
}
export default calendar
