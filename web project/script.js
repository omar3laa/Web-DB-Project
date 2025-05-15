document.addEventListener('DOMContentLoaded', () => {
    const table = document.querySelector('table');
    const addButton = document.querySelector('#add');
    const submitButton = document.querySelector('form');
    let apiData = [];
    window.updateRow = function(id) {
        const savedRows = getLocalUsers();
        const user = [...savedRows, ...apiData].find(u => u.id == id);
       if (user) {
            const query = new URLSearchParams();
            query.set('id', user.id);
            query.set('name', user.name);
            query.set('username', user.username);
            query.set('email', user.email);
            query.set('address', typeof user.address === 'object' ? 
                `${user.address.street}, ${user.address.city}` : user.address);
            
            window.location.href = `form.html?${query.toString()}`;
        };
    };
    
    async function fetchData() {
        try {
            const response = await fetch('https://jsonplaceholder.typicode.com/users');
            apiData = await response.json();
            displayData([...apiData, ...getLocalUsers()]);
        } catch (error) {
            console.error('Error fetching data:', error);
            displayData(getLocalUsers());
        }
    }

    function getLocalUsers() {
        return JSON.parse(localStorage.getItem('userRows') || "[]");
    }
    function displayData(users) {
        const rows = table.querySelectorAll('tr:not(:first-child)');
        rows.forEach(row => row.remove());

        users.forEach(user => {
            const row = document.createElement('tr');
            const td1=document.createElement('td');
            const td2=document.createElement('td');
            const td3=document.createElement('td');
            const td4=document.createElement('td');
            const td5=document.createElement('td');
            const td6=document.createElement('td');
            td1.textContent=user.id;
            td2.textContent=user.name;
            td3.textContent=user.username;
            td4.textContent=user.email;
            td5.textContent=user.address?.street ? `${user.address.street}, ${user.address.city}` : user.address;
            td6.innerHTML=`
                <button onclick="updateRow(${user.id})">Update</button>
                <button onclick="this.closest('tr').remove();removeFromStorage(${user.id})">Delete</button>
            `;
            row.appendChild(td1);
            row.appendChild(td2);
            row.appendChild(td3);
            row.appendChild(td4);
            row.appendChild(td5);
            row.appendChild(td6);
            table.appendChild(row);
        });
    }
    window.removeFromStorage = function(id) {
        const users = getLocalUsers().filter(user => user.id != id);
        localStorage.setItem('userRows', JSON.stringify(users));
    };

    function addUser(event) {
    event.preventDefault();

    const id = document.getElementById('id').value;
    const name = document.getElementById('name').value;
    const username = document.getElementById('username').value;
    const email = document.getElementById('email').value;
    const address = document.getElementById('address').value;
    const user = {
        id,
        name,
        username,
        email,
        address
    };

  let existing = getLocalUsers();
        const index = existing.findIndex(u => u.id == user.id);
        if (index !== -1) {
            existing[index] = user;
        } else {
            existing.push(user);
        }

        localStorage.setItem('userRows', JSON.stringify(existing));
        event.target.reset();
        window.location.href = 'index.html';
    }


    function goToForm() {
        window.location.href = "form.html";
    }

    if (addButton) addButton.addEventListener('click', goToForm);
    if (submitButton) submitButton.addEventListener('submit', addUser);
    fetchData();
});

