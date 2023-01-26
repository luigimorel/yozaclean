import React, { ReactNode } from 'react';
import Footer from './footer';
import Navbar from './navbar';

interface Props {
  children: ReactNode;
}
const Layout: React.FC<Props> = ({ children }) => {
  return (
    <>
      <Navbar />
      {children}
      <Footer />
    </>
  );
};

export default Layout;
