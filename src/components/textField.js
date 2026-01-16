import React from 'react';

const TextField = ({ labelText, onChange }) => {
  return (
    <div>
      <label>{labelText}</label>
      <input type="text" onChange={onChange} />
    </div>
  );
};

export default TextField;
