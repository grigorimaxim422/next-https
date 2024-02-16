import React, { useReducer, useEffect, useRef, useCallback } from 'react';
// import { verifyLogin } from './utils';
import AuthApp from '../AuthApp';
import { useBotsContext } from '../../lib';
require('dotenv').config();
const initialState = {
  username: '',
  password: '',
  isLoading: false,
  isLoggedIn: false,
  error: ''
};

function loginReducer(state, action) {
  switch (action.type) {
    case 'field': {
      return {
        ...state,
        [action.fieldName]: action.payload
      };
    }
    case 'login': {
      return {
        ...state,
        error: '',
        isLoading: true,
        isFocused: true
      };
    }
    case 'success': {
      return {
        ...state,
        isLoggedIn: true,
        isLoading: false
      };
    }
    case 'error': {
      return {
        ...state,
        error: 'Incorrect username or password entered',
        isLoggedIn: false,
        isLoading: false,
        username: '',
        password: '',
        isFocused: true
      };
    }
    case 'logout': {
      return {
        ...state,
        isLoggedIn: false,
        username: '',
        password: '',
        error: ''
      };
    }
    default:
      return state;
  }
}

export default function LoginWithReducer() {
  const apiUrl = process.env.REACT_APP_API_URL;
  console.log('apiUrl: ' + apiUrl);
  const [state, dispatch] = useReducer(loginReducer, initialState);
  const { username, password, isLoading, isLoggedIn, error, isFocused } = state;
  const usernameRef = useRef(null);  
  const { setUserInfo } = useBotsContext();
  // useEffect(() => {
  //   if(state)
  //     console.log('state changed, state=', state)
  // },[state])
  useEffect(() => {
    var _userInfo = localStorage.getItem('userInfo');
    if (_userInfo) {
      console.log("From localstorage=", JSON.parse(_userInfo));
      setUserInfo(JSON.parse(_userInfo));
      dispatch({ type: 'success' });      
    }
  }, [dispatch, setUserInfo]);
  
  const handleSubmit = async e => {
    e.preventDefault();
    // dispatch({ type: 'login' });
    // try {
    //   const { userid } = await verifyLogin({ username, password });
    //   console.log('LoginWithHooks.userid=', userid);
    //   setUserInfo({ userid, username });
    //   dispatch({ type: 'success' });
    // } catch (error) {
    //   dispatch({ type: 'error' });
    // }

    // verifyLogin({ username, password })
    //   .then(({ userid })=> {
    // dispatch({ type: 'success' });
    // setUserInfo({ userid, username });
    //   }).catch(e => {
    //     dispatch({ type: 'error' });
    //     console.error('error=', e);
    //   })
    // dispatch({ type: 'login' });
    
    console.log('state=',state);
    const url = `api/signin.php?username=${username}&password=${password}`;
    console.log('verifyLogin url=', url);
    fetch(url)      
      .then(async response => {
          
        if (response.status === 200) {
            
            const data = await response.json();
            console.log(response.data);
            const { userid } = data;
          dispatch({ type: 'success' });
            setUserInfo({ userid, username });
            localStorage.setItem('userInfo', JSON.stringify({ userid, username }));                        
          } else {
            dispatch({type:'error'})
          }
      })
        .catch(error => {
          dispatch({ type: 'error' });
          console.error(error)
        });
    
  }

  const logout = useCallback(() => { dispatch({ type: 'logout' }); setUserInfo(null); localStorage.removeItem('userInfo'); },[dispatch, setUserInfo])
  useEffect(() => {
    if (isFocused) {
      usernameRef.current.focus();
    }
  }, [isFocused]);

  return (
    <>
      
        {isLoggedIn ? (
          // <>
          //   <h1>Welcome {username}!</h1>
          //   <button onClick={() => dispatch({ type: 'logout' })}>
          //     Log Out
          //   </button>
          // </>
          <AuthApp logout={logout}/>
      ) : (
          <div className="App">
        <div className="login-container">
          <form className="form" onSubmit={handleSubmit}>
            {error && <p className="error">{error} </p>}
            <p>Please Login!</p>
            <input
              type="text"
              ref={usernameRef}
              placeholder="Enter username"
              value={username}
              autoFocus
              onChange={e =>
                dispatch({
                  type: 'field',
                  fieldName: 'username',
                  payload: e.currentTarget.value
                })
              }
            />
            <input
              type="password"
              placeholder="Enter password"
              value={password}
              onChange={e =>
                dispatch({
                  type: 'field',
                  fieldName: 'password',
                  payload: e.currentTarget.value
                })
              }
            />
            <button className="submit" type="submit" disabled={isLoading}>
              {isLoading ? 'Logging In.....' : 'Log In'}
            </button>
            </form>
      </div>
      </div>
        )}
    </>
  );
}
