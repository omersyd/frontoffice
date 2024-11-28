import { createChart, CrosshairMode, LineStyle } from 'lightweight-charts';
import DateRangePicker from 'vanillajs-datepicker/DateRangePicker';

export const Chart = {
    mounted() {

        const currentLocale = window.navigator.languages[0];
        // Create a number format using Intl.NumberFormat
        const myPriceFormatter = Intl.NumberFormat(currentLocale, {
            style: 'currency',
            currency: 'INR', // Currency for data points
        }).format;


        const symbolSelect = document.getElementById('symbol-select');

        const elem = document.getElementById('foo');

        const datepicker = new DateRangePicker(elem, {
            format: 'dd/mm/yyyy'
        });

        console.log("Hook mounted!");

        const chartOptions = {
            layout: { textColor: 'black', background: { type: 'solid', color: 'white' } },
            // width: window.innerWidth/1.5 ,
            height: window.innerHeight / 2,
        };
        const chart = createChart(document.getElementById('chart-container'), chartOptions);
        console.log(chart);
        const areaSeries = chart.addAreaSeries({
            lineColor: '#2962FF', topColor: '#2962FF',
            bottomColor: 'rgba(41, 98, 255, 0.28)',
        });

        chart.applyOptions({
            localization: {
                priceFormatter: myPriceFormatter,
            },
        });

        const toolTipWidth = 80;
        const toolTipHeight = 80;
        const toolTipMargin = 15;

        // Create and style the tooltip html element
        const toolTip = document.createElement('div');
        toolTip.style = `position: absolute; display: none; padding: 8px; box-sizing: border-box; font-size: 12px; text-align: left; z-index: 1000; top: 12px; left: 12px; pointer-events: none; border: 1px solid; border-radius: 2px;font-family: -apple-system, BlinkMacSystemFont, 'Trebuchet MS', Roboto, Ubuntu, sans-serif; -webkit-font-smoothing: antialiased; -moz-osx-font-smoothing: grayscale;`;
        toolTip.style.background = 'white';
        toolTip.style.color = 'black';
        toolTip.style.borderColor = '#2962FF';
        const container = document.getElementById('chart-container');

        container.appendChild(toolTip);


        chart.subscribeCrosshairMove(param => {
            if (
                param.point === undefined ||
                !param.time ||
                param.point.x < 0 ||
                param.point.x > container.clientWidth ||
                param.point.y < 0 ||
                param.point.y > container.clientHeight
            ) {
                toolTip.style.display = 'none';
            } else {
                // time will be in the same format that we supplied to setData.
                // thus it will be YYYY-MM-DD
                const dateStr = param.time;
                toolTip.style.display = 'block';
                const data = param.seriesData.get(areaSeries);
                const price = data.value;
                // const price = data.value !== undefined ? data.value : data.close;
                // console.log('price', price)
                toolTip.innerHTML = `<div style="color: ${'#2962FF'}">${symbolSelect.value}</div><div style="font-size: 24px; margin: 4px 0px; color: ${'black'}">
                ${Math.round(100 * price) / 100}
                </div><div style="color: ${'black'}">
                ${dateStr}
                </div>`;

                const y = param.point.y;
                let left = param.point.x;
                if (left > container.clientWidth - toolTipWidth) {
                    left = param.point.x - toolTipMargin - toolTipWidth;
                }

                let top = y;
                if (top > container.clientHeight - toolTipHeight) {
                    top = y - toolTipHeight - toolTipMargin;
                }
                toolTip.style.left = left + 'px';
                toolTip.style.top = top + 'px';

            }
        });


        chart.timeScale().fitContent();




        const fetchBtn = document.getElementById('fetch-btn');
        fetchBtn.addEventListener('click', () => {
            const symbol = symbolSelect.value;
            console.log('symbol', symbolSelect.value);
            const [from_date, to_date] = datepicker.getDates('yyyy-mm-dd');
            console.log('datepicker', datepicker.getDates('yyyy-mm-dd'));
            console.log("button click occured");

            // Add any initialization logic here
            const baseUrl = "/historical-data";
            const params = new URLSearchParams({
                symbol: symbolSelect.value,
                from_date: from_date,
                to_date: to_date,
            });

            // Build the full URL
            const url = `${baseUrl}?${params.toString()}`;

            // Call the API
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

                    areaSeries.setData(data.data);
                    // Process the data
                })
                .catch((error) => {
                    console.error("Error fetching data:", error); // Handle errors
                });
        })

    },
    updated() {
        console.log("Hook updated!");
        // Handle updates to the component
    },
    destroyed() {
        console.log("Hook destroyed!");
        // Cleanup when the component is removed
    }
};