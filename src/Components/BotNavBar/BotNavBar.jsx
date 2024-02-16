import React, { useCallback } from 'react';
import { useBotsContext } from '../../lib';
import { Button, Container } from 'react-bootstrap';
import { confirm } from '../Confirm';
const BotNavBar = () => {
    const { selectedBot, deleteMessages, updateBot} = useBotsContext();
    const handleDelete = useCallback(async () => {        
        if(await confirm("Are you sure want to delete messages from server?"))
            deleteMessages(selectedBot.uid);
            // deleteMessages('5c5e3669-f43b-404d-994a-160d795c17c23');        
        
    }, [deleteMessages, selectedBot]);
    const handleUpdateBot = useCallback(async (bot) => {
        if (await confirm("Are you sure edit the information of this Bot?")) {
            const username = window.prompt('Please enter username', bot.username ?bot.username:  '');
            const lanip = window.prompt('Please enter lanip', bot.lanip ? bot.lanip : '');
            if (username && lanip) {
                bot.username = username;
                bot.lanip = lanip;
                updateBot(bot);
            }            
        }
    }, [updateBot])
    
    return (
        <Container   className="p-1" style={{}}>
            {/* <h5>{selectedBot? selectedBot.uid:''}</h5> */}
            {
                selectedBot ?
                    <div className="d-flex justify-content-between">
                        <span>Messages from {selectedBot.uid}</span>
                        
                        <div className="inline-block">
                        <Button variant="primary" onClick={()=>handleUpdateBot(selectedBot)} >
                            Update Info
                        </Button>
                        
                        <Button variant="danger" ml={3} onClick={handleDelete} style={{marginLeft:'0.5rem'}}>
                            Remove Messages
                        </Button>
                        </div>
                    </div>
                    :
                    <div>
                             &nbsp;                                         
                    </div>
            }

        </Container>
    )
}

export default BotNavBar