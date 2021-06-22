import * as React from "react";
import ReactEcharts from 'echarts-for-react';
import { useComparisonContext } from "./ComparisonProvider";
import Typography from '@material-ui/core/Typography';
import { useStyles } from './styles'

export default function RatesComparisonChart() {
  const classes = useStyles()
  const { hotels } = useComparisonContext()

  const getOption = () => {
    const data = hotels.map(hotel => {
      const sortedRates = _.sortBy(hotel.rates, 'actual_on')
      return {
        name: hotel.name,
        data: sortedRates.map(rate => [rate.actual_on, rate.daily_rate])
      }
    })

    return ({
      grid: {
        right: 35,
        bottom: 40,
        containLabel: true,
      },
      dataset: data.map((hotel) => ({
        source: hotel.data,
        dimensions: ['Date', 'Value'],
      })),
      legend: {
        show: true,
      },
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
        type: 'time',
        nameLocation: 'middle',
        boundaryGap: false,
      },
      yAxis: [
        {
          axisLine: {
            show: true,
          },
        },
      ],
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
      series: data.map((value, index) => ({
        type: 'line',
        name: value.name,
        datasetIndex: index,
        encode: {
          x: 'Date',
          y: 'Value',
        },
        smooth: true,
        showSymbol: false,
      }))
    });
  }

  return (
    <div className={classes.graphBlock}>
      <Typography variant="h6">
        Dailry Rates History
      </Typography>
      <ReactEcharts
        option={getOption()}
        notMerge={true}
      />
    </div>
  );
}