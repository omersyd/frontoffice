export const Holding = {
    mounted() {
        console.log("Mounted holding container");

        // Function to calculate and render Total Profit/Loss card
        function renderProfitLossCard(data) {
            const container = document.getElementById("profit-loss-card");

            // Calculate total PnL
            const totalPnL = data.reduce((sum, holding) => sum + holding.pnl, 0);

            // Create card element
            const card = document.createElement("div");
            card.className =
                "p-4 bg-white border border-gray-300 rounded-md shadow-md w-full max-w-sm text-center";

            // Add content
            card.innerHTML = `
                <h2 class="text-lg font-bold text-gray-700">Total Profit/Loss</h2>
                <p class="text-2xl font-semibold ${totalPnL >= 0 ? "text-green-600" : "text-red-600"
                }">
                    ₹${totalPnL.toFixed(2)}
                </p>
                `;

            // Append the card to the container
            container.appendChild(card);
        }

        // Function to render the table
        function renderTable(data) {
            // Select the container where the table will be inserted
            const container = document.getElementById("table-container");

            // Create the table element
            const table = document.createElement("table");
            table.className =
                "table-auto w-full border-collapse border border-gray-300 bg-white";

            // Table header
            const headers = [
                "Exchange",
                "Last Price",
                "Close Price",
                "PnL",
                "Day Change",
                "ISIN",
                "Quantity",
                "Trading Symbol",
                "Authorised Date",
                "Average Price",
                "Day Change (%)",
            ];
            const thead = document.createElement("thead");
            thead.className = "bg-gray-200";
            const headerRow = document.createElement("tr");

            headers.forEach((header) => {
                const th = document.createElement("th");
                th.className =
                    "border border-gray-300 px-4 py-2 text-left font-medium text-gray-600";
                th.textContent = header;
                headerRow.appendChild(th);
            });

            thead.appendChild(headerRow);
            table.appendChild(thead);

            // Table body
            const tbody = document.createElement("tbody");

            data.forEach((row) => {
                const tr = document.createElement("tr");
                tr.className = "hover:bg-gray-100";

                // Populate row data
                const rowData = [
                    row.exchange,
                    row.last_price.toFixed(2),
                    row.close_price.toFixed(2),
                    row.pnl.toFixed(2),
                    row.day_change.toFixed(2),
                    row.isin,
                    row.quantity,
                    row.tradingsymbol,
                    row.authorised_date,
                    row.average_price.toFixed(2),
                    row.day_change_percentage.toFixed(2),
                ];

                rowData.forEach((cellData) => {
                    const td = document.createElement("td");
                    td.className = "border border-gray-300 px-4 py-2 text-gray-700";
                    td.textContent = cellData;
                    tr.appendChild(td);
                });

                tbody.appendChild(tr);
            });

            table.appendChild(tbody);

            // Append the table to the container
            container.appendChild(table);
        }

        function renderProfileCard(data) {
            const container = document.getElementById("profile-card");

            // Create card element
            const card = document.createElement("div");
            card.className =
                "p-6 bg-white border border-gray-300 rounded-md shadow-lg w-full max-w-sm";

            // Add content to the card
            card.innerHTML = `
              <h2 class="text-xl font-bold text-gray-800 mb-4">Account Details</h2>
              <div class="space-y-2">
                <div class="flex justify-between">
                  <span class="font-medium text-gray-600">User Name:</span>
                  <span class="text-gray-700">${data.user_name}</span>
                </div>
                <div class="flex justify-between">
                  <span class="font-medium text-gray-600">User ID:</span>
                  <span class="text-gray-700">${data.user_id}</span>
                </div>
                <div class="flex justify-between">
                  <span class="font-medium text-gray-600">User Type:</span>
                  <span class="text-gray-700 capitalize">${data.user_type}</span>
                </div>
                <div class="flex justify-between">
                  <span class="font-medium text-gray-600">Email:</span>
                  <span class="text-gray-700">${data.email}</span>
                </div>
                <div class="flex justify-between">
                  <span class="font-medium text-gray-600">Broker:</span>
                  <span class="text-gray-700">${data.broker}</span>
                </div>
              </div>
            `;

            // Append card to the container
            container.appendChild(card);
        }


        const baseUrlProfile = "/user/profile";
        const paramsProfile = new URLSearchParams({
            email: "xxxyyy@gmail.com"
        });

        const urlProfile = `${baseUrlProfile}?${paramsProfile.toString()}`;

        fetch(urlProfile, {
            method: "GET", // HTTP method
            headers: {
                "Content-Type": "application/json",
            },
        })
            .then((response) => {
                if (!response.ok) {
                    throw new Error(`HTTP error! status: ${response.status}`);
                }
                return response.json(); // Parse JSON response
            })
            .then((data) => {
                console.log("Data received:", data.data);

                renderProfileCard(data.data);
            })
            .catch((error) => {
                console.error("Error fetching data:", error); // Handle errors
            });

        const baseUrl = "/portfolio/holdings";
        const params = new URLSearchParams({
            uid: "AB1234"
        });

        const url = `${baseUrl}?${params.toString()}`;

        fetch(url, {
            method: "GET", // HTTP method
            headers: {
                "Content-Type": "application/json",
            },
        })
            .then((response) => {
                if (!response.ok) {
                    throw new Error(`HTTP error! status: ${response.status}`);
                }
                return response.json(); // Parse JSON response
            })
            .then((data) => {
                console.log("Data received:", data.data);
                // Call the function with the API data
                renderProfitLossCard(data.data);

                renderTable(data.data);
            })
            .catch((error) => {
                console.error("Error fetching data:", error); // Handle errors
            });
    },
    updated() {
        console.log("Hook updated!");
        // Handle updates to the component
    },
    destroyed() {
        console.log("Hook destroyed!");
        // Cleanup when the component is removed
    }
}