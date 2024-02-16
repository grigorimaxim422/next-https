import React, { useState} from 'react';
import { Button, FormControl, Form, FormGroup, FormLabel, Row,Col, Table } from "react-bootstrap";
import { useBotsContext } from "../../lib";
import { useEffect } from 'react';
import { useRef } from 'react';
import './index.css';
import { useCallback } from 'react';
import { confirm } from '../Confirm';

const WalletList = () => {
    const { balanceList, addWallet, deleteWallet, updateWallet } = useBotsContext();    

    const sortedBalanceList =  balanceList.sort((b,a) =>
        Math.max(parseFloat(a.usd), parseFloat(a.usdt), parseFloat(a.usdc)) - Math.max(parseFloat(b.usd), parseFloat(b.usdt), parseFloat(b.usdc)));
    // console.log('sortedBalanceList=', sortedBalanceList);
    const tableRef = useRef(null);
     
    useEffect(() => {
        if (tableRef != null) {
            tableRef.current.scrollTop = 0;
        }        
    }, [tableRef]);

    const getLink = useCallback((address, network) => {
        let prefix = 'https://blockscan.com/address/';
        
        if (network === 'avalanche')
            prefix = 'https://avascan.info/blockchain/all/address/';
        else if (network === 'ethereum')
            prefix = 'https://etherscan.io/address/';
        else if (network === 'polygon') {
            prefix = 'https://polygonscan.com/address/';
        }else if (network === 'fantom') {
            prefix = 'https://ftmscan.com/address/';
        }else if (network === 'binancecoin') {
            prefix = 'https://bscscan.com/address/';
        }else if (network === 'solana') {
            prefix = 'https://solscan.io/account/';
        }else if (network === 'bitcoin') {
            prefix = 'https://www.blockchain.com/explorer/addresses/btc/';
        }else if (network === 'tron') {
            prefix = 'https://tronscan.org/#/address/';
        }
        return prefix + address;
    }, []);
    // const [selectedBalance, setSelectedBalance] = useState(null);

    const [formInput, setFormInput] = useState({
        address: '',
        network: '',
        label: '',
        mode:0,
    });

    // useEffect(() => { 
    //     setFormInput({
    //         mode: 1,
            
    //     })
    // }, [selectedBalance]);
    const handleChange = e => {
        setFormInput({
            ...formInput,
            [e.target.name]: e.target.value
        });
    };
    const handleCancel = () => {
        setFormInput({
            address: '',
            network: '',
            label: '',
            mode: 0,
        });
    };
    const handleSelect = balance => {
        setFormInput({
            address: balance.address,
            network: (balance.network === 'solana' || balance.network === 'tron' || balance.network === 'bitcoin') ? balance.network : 'ethereum',
            label: balance.label,
            id: balance.id,
            mode: 1,
        });
    };
    const handleDelete = async balance => {        
        if (await confirm("Are you sure want to delete this balance address?")) {            
            deleteWallet(balance);            
        }
    };    
    
    const handleSubmit = e => {
        e.preventDefault();
        if (formInput.mode === 0) {
            //New wallet
            if (formInput.network === '') {
                window.alert("Please select the network type");
                return;
            }
            if (formInput.address === "") {
                window.alert("Please input the valid address");
                return;
            }
            addWallet({
                ...formInput,
                type: formInput.network
            });
            setFormInput({
                ...formInput,
                address: '',
                network: '',
                label: '',               
            });
        } else if (formInput.mode === 1) {
            // if (formInput.network === '') {
            //     window.alert("Please select the network type");
            //     return;
            // }
            // if (formInput.address === "") {
            //     window.alert("Please input the valid address");
            //     return;
            // }
            updateWallet({
                ...formInput,
                type: formInput.network
            });
            setFormInput({
                address: '',
                network: '',
                label: '',
                mode: 0
            });
        }

    }

    return (
        <div className='main-content' ref={tableRef}>
            <div className='float-right'>
                <Form className="pb-2" onSubmit={handleSubmit}>
                    <Row>
                        <Col md={3}>
                    <FormGroup controlId='address'>
                        <FormLabel>Address</FormLabel>
                        <FormControl
                                    type="text"
                                    disabled={formInput.mode===1}
                            placeholder="Wallet Address"                                                        
                                    name="address"
                                    className='my-0'
                            value={formInput.address}
                            onChange={handleChange}                    
                        />
                            </FormGroup>
                        </Col>
                        <Col md={3}>
                    <FormGroup controlId='network'>
                        <FormLabel>Network</FormLabel>
                                <FormControl as="select" name="network"
                                    disabled={formInput.mode===1}
                            value={formInput.network}
                            onChange={handleChange}>
                            <option value=""></option>
                            <option value="ethereum">Ethereum</option>
                            <option value="tron">Tron</option>
                            <option value="solana">Solana</option>
                            <option value="bitcoin">Bitcoin</option>                        
                        </FormControl>
                            </FormGroup>
                            </Col>
                        <Col md={3}>
                    <FormGroup>
                        <FormLabel>Label</FormLabel>
                        <FormControl type="text"
                            placeholder="Wallet owner"
                            className='my-0'
                            name="label"
                            value={formInput.label}
                            onChange={handleChange}
                        />
                            </FormGroup>
                            </Col>
                        <Col md={3}  className="pt-4">                                                        
                            <Button variant="primary" type="submit">
                                {formInput.mode===0?'Add Wallet':'Save'}
                            </Button>                            
                            <span className='px-2'/>
                            {
                                formInput.mode === 1 &&
                                <Button variant="warning" type="button" onClick={handleCancel}>
                                    Cancel    
                                </Button>
                            }
                    </Col>
                    </Row>
                </Form>
            </div>
            <Table  bordered hover className='cursor-pointer table-sm'>
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Label</th>
                        <th>Address</th>
                        <th>Network</th>
                        <th>Balance</th>
                        <th>USD</th>
                        <th>USDT</th>
                        <th>USDC</th>
                        <th>Updated at</th>
                        <th>&nbsp;</th>
                    </tr>
                </thead>
                <tbody>
                    {
                        sortedBalanceList.map((balance, idx) =>
                        (
                            <tr key={balance.id} className={`${balance.unread > 0 ? 'table-warning font-weight-bold' : ''}`}
                                onClick={()=>handleSelect(balance)}
                            >
                                <td>{idx+1}</td>
                                <td>{balance.label}</td>
                                <td>
                                    <a href={getLink(balance.address, balance.network)}
                                        target="_blank" 
                                        rel="noopener noreferrer"
                                    >
                                        {balance.address}</a></td>
                                <td>
                                    <img src={`./img/${balance.network}.png`} width={24} height={24} alt={balance.network } />
                                    &nbsp;{balance.network}
                                    
                                </td>
                                <td>{parseFloat(balance.balance).toFixed(6)}</td>
                                <td className={`${parseFloat(balance.usd)>=40.0?parseFloat(balance.usd)>=400.0?'bg-danger text-white':'bg-warning':''}`}>
                                    <strong color="text-warning">&#65284;</strong>{parseFloat(balance.usd).toFixed(4)}
                                </td>
                                <td className={`${parseFloat(balance.usdt)>=40.0?parseFloat(balance.usdt)>=400.0?'bg-danger text-white':'bg-warning':''}`}>
                                    <img src={`./img/usdt.png`} width={16}  height={16} alt='usdt'/>&nbsp;
                                    {parseFloat(balance.usdt).toFixed(4)}
                                </td>
                                <td className={`${parseFloat(balance.usdc)>=40.0?parseFloat(balance.usdc)>=400.0?'bg-danger text-white':'bg-warning':''}`}>
                                    <img src={`./img/usdc.png`} width={16} height={16} alt='usdc'/>
                                    &nbsp;
                                    {parseFloat(balance.usdc).toFixed(4)}
                                </td>
                                <td>{balance.updatedAt}</td>
                                <td>
                                    <div>
                                        <Button className="btn btn-sm btn-danger rounded"
                                            onClick={()=>handleDelete(balance)}
                                        >Delete</Button>
                                    </div>
                                </td>
                            </tr>
                        ))
                    }
                </tbody>
            </Table>
        </div>
    )
}

export default WalletList;