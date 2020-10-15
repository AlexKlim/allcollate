import React from "react";
import { Table } from 'tabler-react';

function SearchResults() {
  return(
    <Table>
      <Table.Header>
        <Table.ColHeader></Table.ColHeader>
        <Table.ColHeader>Hotel</Table.ColHeader>
        <Table.ColHeader>Location</Table.ColHeader>
        <Table.ColHeader>Opened/Renovated</Table.ColHeader>
        <Table.ColHeader>Rate</Table.ColHeader>
        <Table.ColHeader>Rating</Table.ColHeader>
      </Table.Header>
      <Table.Body>
        {/* <SearchResultItem /> */}
      </Table.Body>
    </Table>
  )
}

export default SearchResults;
