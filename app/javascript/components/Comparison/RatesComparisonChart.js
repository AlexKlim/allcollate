import * as React from "react";
import echarts from 'echarts';
import ReactEcharts from 'echarts-for-react';
import { useComparisonContext } from "./ComparisonProvider";

export default function RatesComparisonChart(props) {

    const {hotels} = useComparisonContext()

    const {currentHotel} = props

    const {rates, name} = currentHotel

  const getOption = () => {
    const sortedRates = hotels.map(hotel => hotel.rates)
    const date = sortedRates.map(hotel => {
        return hotel.map(item => item.actual_on)
    })
    
    const data = sortedRates.map(r => {
        return r.map(item => item.daily_rate)
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
                name: `${name} Rates`
              }
          }
      },
      xAxis: {
          type: 'category',
          boundaryGap: false,
          data: date[0]
      },
      yAxis: {
          type: 'value',
          boundaryGap: [0, '100%']
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
              shadowColor: 'rgba(0, 0, 0, 0.6)',
              shadowOffsetX: 2,
              shadowOffsetY: 2
          }
      }],
      series: data.map(i => {
          return (          {
            name: 'Currency ($)',
            type: 'line',
            smooth: true,
            symbol: 'none',
            sampling: 'average',
            itemStyle: {
                color: 'rgb(255, 70, 131)'
            },
            areaStyle: {
                color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                    offset: 0,
                    color: 'rgb(255, 158, 68)'
                }, {
                    offset: 1,
                    color: 'rgb(255, 70, 131)'
                }])
            },
            data: i
        })
      })
    //   [
        //   {
        //       name: 'Currency ($)',
        //       type: 'line',
        //       smooth: true,
        //       symbol: 'none',
        //       sampling: 'average',
        //       itemStyle: {
        //           color: 'rgb(255, 70, 131)'
        //       },
        //       areaStyle: {
        //           color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
        //               offset: 0,
        //               color: 'rgb(255, 158, 68)'
        //           }, {
        //               offset: 1,
        //               color: 'rgb(255, 70, 131)'
        //           }])
        //       },
        //       data: data
        //   }
    //   ]
  });
  }

    return (
      <ReactEcharts option={getOption()} />
    );
}

