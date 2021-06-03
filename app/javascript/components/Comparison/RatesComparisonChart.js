import * as React from "react";
import echarts from 'echarts';
import ReactEcharts from 'echarts-for-react';
import { useComparisonContext } from "./ComparisonProvider";
import { useEffect, useState } from 'react';

export default function RatesComparisonChart() {

    const { hotels } = useComparisonContext()

    const getOption = () => {

        const date = hotels.map(hotel => {
            return hotel.rates.map(item => item.actual_on)
        })

        let correctDate = []

        date.map(hotelDateRates => {
            hotelDateRates.map(hotelDateRate => {
                correctDate.push(hotelDateRate)
            })
        })

        const uniqueDate = Array.from(new Set(correctDate))


        const data = hotels.map(hotel => {
            const dailyRates = hotel.rates.map(item => item.daily_rate)
            return {
                rates: dailyRates,
                hotelName: hotel.name
            }

        })

        return ({
            tooltip: {
                trigger: 'axis',
                position: function (pt) {
                    return [pt[0], '10%'];
                }
            },
            toolbox: {
                feature: {
                    saveAsImage: {
                        title: 'Download',
                        name: `Rates`
                    }
                }
            },
            xAxis: {
                type: 'category',
                nameLocation: 'middle',
                boundaryGap: false,
                data: uniqueDate
            },
            yAxis: {
                type: 'value',
                name: 'Rate',
                boundaryGap: [0, '10%']
            },
            dataZoom: [{
                type: 'inside',
                start: 0,
            }, {
                start: 0,
                end: 10,
                handleIcon: 'M10.7,11.9v-1.3H9.3v1.3c-4.9,0.3-8.8,4.4-8.8,9.4c0,5,3.9,9.1,8.8,9.4v1.3h1.3v-1.3c4.9-0.3,8.8-4.4,8.8-9.4C19.5,16.3,15.6,12.2,10.7,11.9z M13.3,24.4H6.7V23h6.6V24.4z M13.3,19.6H6.7v-1.4h6.6V19.6z',
                handleSize: '80%',
                handleStyle: {
                    color: '#fff',
                    shadowBlur: 3,
                    shadowOffsetX: 2,
                    shadowOffsetY: 2
                }
            }],
            series: data.map(i => {
                return ({
                    name: `Currency ($) ${i.hotelName}`,
                    type: 'line',
                    smooth: false,
                    showSymbol: false,
                    data: i.rates
                })
            })
        });
    }
    

    return (
        <ReactEcharts option={getOption()} />
    );
}