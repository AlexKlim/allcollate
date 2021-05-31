import { makeStyles } from '@material-ui/core/styles'

export const useStyles = makeStyles({
    page: {
      minWidth: '100%'
    },
    content: {
      width: '100%'
    },
    pageHeader: {
      display: 'flex',
      marginTop: '50px',
      display: 'flex',
      flexWrap: 'wrap',
      alignItems: 'center'
    },
    titleBox: {
      width: 'fit-content'
    },
    title: {
      fontStyle: 'normal',
      fontWeight: 'normal',
      fontSize: '34px',
      lineHeight: '40px',
      color: 'black'
    },
    searchBox: {
      width: '6000px',
    },
    noHotelsBox: {
      position: 'absolute',
      minWidth: '100%;',
      left: 0,
      textAlign: 'center',
      backgroundColor: '#F5F7FB'
    },
    noHotelsTitle: {
      marginTop: '15%'
    },
    contentBox: {
      alignSelf: 'flex-center',
      width: '100%',
      height: '100%',
      display: 'flex',
      flexWrap: 'wrap',
      justifyContent: 'space-around',
      alignItems: 'center'
    },
    card: {
      width: '245px',
      height: '245px',
    },
    cardHeader: {
      align: 'center'
    },
    media: {
      height: '0px',
      paddingTop: '56.25%',
    },
    removeButton: {
      '&:hover': {
        cursor: 'pointer'
      }
    },
    table: {
      borderTopWidth: 1,
      marginTop: '50px'
    },
    row: {
      border: '1px;',
      borderWidth: '1px;',
      borderColor: 'grey;',
      borderStyle: 'solid;',
      borderRadius: '4px;'
    },
    cell: {
      minWidth: '340px;'
    },
    // leftColumn: {
    //   position: 'sticky',
    //   left: '0px',
    //   backgroundColor: '#F5F7FB',
    //   zIndex: '9999999'
    // },
    noHotelsBox: {
      minWidth: '100%;',
      marginTop: '25%'
    },
    headerCardBox: {
      display: 'flex',
      flexWrap: 'wrap',
      justifyContent: 'space-around',
      alignItems: 'center'
    },
    leftColumn: {
      position: 'sticky',
      left: '0px',
      color: 'black',
      backgroundColor: '#F5F7FB',
      zIndex: '9999999',
      width: 'fit-content',
      minWidth: '150px',
      borderRight: '1px solid #ececec',
      borderLeft: '1px solid #ececec'
    },
    dataCell: {
      borderRight: '1px solid #ececec'
    }
  })