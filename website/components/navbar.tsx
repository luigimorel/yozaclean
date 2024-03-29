import Link from 'next/link';

import { Disclosure } from '@headlessui/react';
import ThemeChanger from './DarkSwitch';

export default function Navbar() {
  const navigation = [
    {
      id: 1,
      linkText: 'Why YozaClean',
      link: '/#why',
    },
    {
      id: 2,
      linkText: 'How it works',
      link: '/#how',
    },

    {
      id: 3,
      linkText: 'FAQ',
      link: '/#faq',
    },

    {
      id: 2,
      linkText: 'Contact Us',
      link: '#contact',
    },
  ];

  return (
    <div className="w-full shadow-sm ">
      <nav className="container  flex flex-wrap items-center justify-between p-8 mx-auto lg:justify-between xl:px-0">
        {/* Logo  */}
        <Disclosure>
          {({ open }) => (
            <>
              <div className="flex flex-wrap items-center justify-between w-full lg:w-auto">
                <Link href="/">
                  <a className="flex items-center space-x-2 text-2xl font-medium text-primary dark:text-gray-100">
                    <span className=" font-bold">YozaClean</span>
                  </a>
                </Link>

                <Disclosure.Button
                  aria-label="Toggle Menu"
                  className="px-2 py-1 ml-auto text-gray-500 rounded-md lg:hidden hover:text-primary focus:text-primary focus:bg-indigo-100 focus:outline-none dark:text-gray-300 dark:focus:bg-neutral-700">
                  <svg
                    className="w-6 h-6 fill-current"
                    xmlns="http://www.w3.org/2000/svg"
                    viewBox="0 0 24 24">
                    {open && (
                      <path
                        fillRule="evenodd"
                        clipRule="evenodd"
                        d="M18.278 16.864a1 1 0 0 1-1.414 1.414l-4.829-4.828-4.828 4.828a1 1 0 0 1-1.414-1.414l4.828-4.829-4.828-4.828a1 1 0 0 1 1.414-1.414l4.829 4.828 4.828-4.828a1 1 0 1 1 1.414 1.414l-4.828 4.829 4.828 4.828z"
                      />
                    )}

                    {!open && (
                      <path
                        fillRule="evenodd"
                        d="M4 5h16a1 1 0 0 1 0 2H4a1 1 0 1 1 0-2zm0 6h16a1 1 0 0 1 0 2H4a1 1 0 0 1 0-2zm0 6h16a1 1 0 0 1 0 2H4a1 1 0 0 1 0-2z"
                      />
                    )}
                  </svg>
                </Disclosure.Button>

                <Disclosure.Panel className="flex flex-wrap w-full my-5 lg:hidden">
                  <Link href="#why">
                    <a className="w-full px-4 py-2 -ml-4 text-gray-500 rounded-md dark:text-gray-300 hover:text-primary focus:text-primary focus:bg-indigo-100  focus:outline-none dark:focus:bg-neutral-700">
                      Why use YozaClean
                    </a>
                  </Link>

                  <Link href="#contact">
                    <a className="w-full px-4 py-2 -ml-4 text-gray-500 rounded-md dark:text-gray-300 hover:text-primary focus:text-primary focus:bg-indigo-100  focus:outline-none dark:focus:bg-neutral-700">
                      Contact
                    </a>
                  </Link>
                </Disclosure.Panel>
              </div>
            </>
          )}
        </Disclosure>

        {/* menu  */}
        <div className="hidden text-center lg:flex lg:items-center">
          <ul className="items-center justify-end flex-1 pt-6 list-none lg:pt-0 lg:flex">
            {navigation.map((menu, index) => (
              <li className="mr-3 nav__item" key={menu.id}>
                <Link href={menu.link}>
                  <a className="inline-block px-4 py-2 text-lg font-normal text-gray-800 no-underline rounded-md dark:text-gray-200 hover:text-primary focus:text-primary focus:bg-indigo-100 focus:outline-none dark:focus:bg-gray-800">
                    {menu.linkText}
                  </a>
                </Link>
              </li>
            ))}
          </ul>
        </div>

        <div className="hidden mr-3 space-x-4 lg:flex nav__item">
          {/* <Link href="/">
              <a className="px-6 py-3 font-bold text-white bg-primary rounded-md md:ml-5">
                Create Account
              </a>
            </Link> */}

          <ThemeChanger />
        </div>
      </nav>
    </div>
  );
}
