import axios from 'axios';

const api = axios.create({
  baseURL: "http://localhost:4000"
});

export const fetchBackgroundImage = async () => {
  try {
    const response = await api.get("/pexel-image"); 
    return response.data;
  } catch (error) { // This should be inside the catch block
    console.error('Error fetching background image:', error);
    console.log(error.response); 
    return null;
  }
};

export const fetchMessage = async () => {
  try {
    const response = await api.get("/techy");
    return response.data;
  } catch (error) {
    console.error('Error fetching message:', error);
    console.log(error.response); 
    return null;
  }
};


