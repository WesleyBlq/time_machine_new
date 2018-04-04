/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "/packs/";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 57);
/******/ })
/************************************************************************/
/******/ ({

/***/ 57:
/*!*************************************************!*\
  !*** ./app/javascript/packs/reddit/actions.jsx ***!
  \*************************************************/
/*! exports provided: REQUEST_POSTS, RECEIVE_POSTS, SELECT_SUBREDDIT, INVALIDATE_SUBREDDIT, selectSubreddit, invalidateSubreddit, fetchPostsIfNeeded */
/*! all exports used */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("Object.defineProperty(__webpack_exports__, \"__esModule\", { value: true });\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"REQUEST_POSTS\", function() { return REQUEST_POSTS; });\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"RECEIVE_POSTS\", function() { return RECEIVE_POSTS; });\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"SELECT_SUBREDDIT\", function() { return SELECT_SUBREDDIT; });\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"INVALIDATE_SUBREDDIT\", function() { return INVALIDATE_SUBREDDIT; });\n/* harmony export (immutable) */ __webpack_exports__[\"selectSubreddit\"] = selectSubreddit;\n/* harmony export (immutable) */ __webpack_exports__[\"invalidateSubreddit\"] = invalidateSubreddit;\n/* harmony export (immutable) */ __webpack_exports__[\"fetchPostsIfNeeded\"] = fetchPostsIfNeeded;\nthrow new Error(\"Cannot find module \\\"cross-fetch\\\"\");\n\n\nvar REQUEST_POSTS = 'REQUEST_POSTS';\nvar RECEIVE_POSTS = 'RECEIVE_POSTS';\nvar SELECT_SUBREDDIT = 'SELECT_SUBREDDIT';\nvar INVALIDATE_SUBREDDIT = 'INVALIDATE_SUBREDDIT';\n\nfunction selectSubreddit(subreddit) {\n  return {\n    type: SELECT_SUBREDDIT,\n    subreddit: subreddit\n  };\n}\n\nfunction invalidateSubreddit(subreddit) {\n  return {\n    type: INVALIDATE_SUBREDDIT,\n    subreddit: subreddit\n  };\n}\n\nfunction requestPosts(subreddit) {\n  return {\n    type: REQUEST_POSTS,\n    subreddit: subreddit\n  };\n}\n\nfunction receivePosts(subreddit, json) {\n  return {\n    type: RECEIVE_POSTS,\n    subreddit: subreddit,\n    posts: json.data.children.map(function (child) {\n      return child.data;\n    }),\n    receivedAt: Date.now()\n  };\n}\n\nfunction fetchPosts(subreddit) {\n  return function (dispatch) {\n    dispatch(requestPosts(subreddit));\n    return __WEBPACK_IMPORTED_MODULE_0_cross_fetch___default()('https://www.reddit.com/r/' + subreddit + '.json').then(function (response) {\n      return response.json();\n    }).then(function (json) {\n      return dispatch(receivePosts(subreddit, json));\n    });\n  };\n}\n\nfunction shouldFetchPosts(state, subreddit) {\n  var posts = state.postsBySubreddit[subreddit];\n  if (!posts) {\n    return true;\n  } else if (posts.isFetching) {\n    return false;\n  } else {\n    return posts.didInvalidate;\n  }\n}\n\nfunction fetchPostsIfNeeded(subreddit) {\n  return function (dispatch, getState) {\n    if (shouldFetchPosts(getState(), subreddit)) {\n      return dispatch(fetchPosts(subreddit));\n    }\n  };\n}//# sourceURL=[module]\n//# sourceMappingURL=data:application/json;charset=utf-8;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiNTcuanMiLCJzb3VyY2VzIjpbIndlYnBhY2s6Ly8vLi9hcHAvamF2YXNjcmlwdC9wYWNrcy9yZWRkaXQvYWN0aW9ucy5qc3g/ZDZlMCJdLCJzb3VyY2VzQ29udGVudCI6WyJpbXBvcnQgZmV0Y2ggZnJvbSAnY3Jvc3MtZmV0Y2gnO1xuXG5leHBvcnQgdmFyIFJFUVVFU1RfUE9TVFMgPSAnUkVRVUVTVF9QT1NUUyc7XG5leHBvcnQgdmFyIFJFQ0VJVkVfUE9TVFMgPSAnUkVDRUlWRV9QT1NUUyc7XG5leHBvcnQgdmFyIFNFTEVDVF9TVUJSRURESVQgPSAnU0VMRUNUX1NVQlJFRERJVCc7XG5leHBvcnQgdmFyIElOVkFMSURBVEVfU1VCUkVERElUID0gJ0lOVkFMSURBVEVfU1VCUkVERElUJztcblxuZXhwb3J0IGZ1bmN0aW9uIHNlbGVjdFN1YnJlZGRpdChzdWJyZWRkaXQpIHtcbiAgcmV0dXJuIHtcbiAgICB0eXBlOiBTRUxFQ1RfU1VCUkVERElULFxuICAgIHN1YnJlZGRpdDogc3VicmVkZGl0XG4gIH07XG59XG5cbmV4cG9ydCBmdW5jdGlvbiBpbnZhbGlkYXRlU3VicmVkZGl0KHN1YnJlZGRpdCkge1xuICByZXR1cm4ge1xuICAgIHR5cGU6IElOVkFMSURBVEVfU1VCUkVERElULFxuICAgIHN1YnJlZGRpdDogc3VicmVkZGl0XG4gIH07XG59XG5cbmZ1bmN0aW9uIHJlcXVlc3RQb3N0cyhzdWJyZWRkaXQpIHtcbiAgcmV0dXJuIHtcbiAgICB0eXBlOiBSRVFVRVNUX1BPU1RTLFxuICAgIHN1YnJlZGRpdDogc3VicmVkZGl0XG4gIH07XG59XG5cbmZ1bmN0aW9uIHJlY2VpdmVQb3N0cyhzdWJyZWRkaXQsIGpzb24pIHtcbiAgcmV0dXJuIHtcbiAgICB0eXBlOiBSRUNFSVZFX1BPU1RTLFxuICAgIHN1YnJlZGRpdDogc3VicmVkZGl0LFxuICAgIHBvc3RzOiBqc29uLmRhdGEuY2hpbGRyZW4ubWFwKGZ1bmN0aW9uIChjaGlsZCkge1xuICAgICAgcmV0dXJuIGNoaWxkLmRhdGE7XG4gICAgfSksXG4gICAgcmVjZWl2ZWRBdDogRGF0ZS5ub3coKVxuICB9O1xufVxuXG5mdW5jdGlvbiBmZXRjaFBvc3RzKHN1YnJlZGRpdCkge1xuICByZXR1cm4gZnVuY3Rpb24gKGRpc3BhdGNoKSB7XG4gICAgZGlzcGF0Y2gocmVxdWVzdFBvc3RzKHN1YnJlZGRpdCkpO1xuICAgIHJldHVybiBmZXRjaCgnaHR0cHM6Ly93d3cucmVkZGl0LmNvbS9yLycgKyBzdWJyZWRkaXQgKyAnLmpzb24nKS50aGVuKGZ1bmN0aW9uIChyZXNwb25zZSkge1xuICAgICAgcmV0dXJuIHJlc3BvbnNlLmpzb24oKTtcbiAgICB9KS50aGVuKGZ1bmN0aW9uIChqc29uKSB7XG4gICAgICByZXR1cm4gZGlzcGF0Y2gocmVjZWl2ZVBvc3RzKHN1YnJlZGRpdCwganNvbikpO1xuICAgIH0pO1xuICB9O1xufVxuXG5mdW5jdGlvbiBzaG91bGRGZXRjaFBvc3RzKHN0YXRlLCBzdWJyZWRkaXQpIHtcbiAgdmFyIHBvc3RzID0gc3RhdGUucG9zdHNCeVN1YnJlZGRpdFtzdWJyZWRkaXRdO1xuICBpZiAoIXBvc3RzKSB7XG4gICAgcmV0dXJuIHRydWU7XG4gIH0gZWxzZSBpZiAocG9zdHMuaXNGZXRjaGluZykge1xuICAgIHJldHVybiBmYWxzZTtcbiAgfSBlbHNlIHtcbiAgICByZXR1cm4gcG9zdHMuZGlkSW52YWxpZGF0ZTtcbiAgfVxufVxuXG5leHBvcnQgZnVuY3Rpb24gZmV0Y2hQb3N0c0lmTmVlZGVkKHN1YnJlZGRpdCkge1xuICByZXR1cm4gZnVuY3Rpb24gKGRpc3BhdGNoLCBnZXRTdGF0ZSkge1xuICAgIGlmIChzaG91bGRGZXRjaFBvc3RzKGdldFN0YXRlKCksIHN1YnJlZGRpdCkpIHtcbiAgICAgIHJldHVybiBkaXNwYXRjaChmZXRjaFBvc3RzKHN1YnJlZGRpdCkpO1xuICAgIH1cbiAgfTtcbn1cblxuXG4vLy8vLy8vLy8vLy8vLy8vLy9cbi8vIFdFQlBBQ0sgRk9PVEVSXG4vLyAuL2FwcC9qYXZhc2NyaXB0L3BhY2tzL3JlZGRpdC9hY3Rpb25zLmpzeFxuLy8gbW9kdWxlIGlkID0gNTdcbi8vIG1vZHVsZSBjaHVua3MgPSAwIDMgNiA5IDEzIDIyIl0sIm1hcHBpbmdzIjoiQUFBQTtBQUFBO0FBQUE7QUFBQTtBQUFBO0FBQUE7QUFBQTtBQUFBO0FBQUE7QUFBQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBIiwic291cmNlUm9vdCI6IiJ9\n//# sourceURL=webpack-internal:///57\n");

/***/ })

/******/ });