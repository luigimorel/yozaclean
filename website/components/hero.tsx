import Image from 'next/image';

import heroImg from '../public/img/mainshape.png';
import Container from './container';

export default function Hero() {
  return (
    <>
      <Container className="flex flex-wrap xl:h-screen ">
        <div className="flex items-center justify-center w-full lg:w-1/2">
          <div className="max-w-2xl mb-8">
            <h1 className="text-4xl font-bold leading-snug tracking-tight text-gray-800 lg:text-4xl lg:leading-tight xl:text-6xl xl:leading-tight dark:text-white">
              Satsifying your cleaning needs.
            </h1>
            <p className="py-5 text-xl leading-normal text-gray-500 lg:text-xl xl:text-2xl dark:text-gray-300">
              For quality cleaning services from your car to your home, to your
              office or workplace. Download the app today.
            </p>

            <div className="flex justify-center xl:justify-start">
              <div className=" flex flex-col">
                <a href="#">
                  <img
                    className="h-32 w-32 xl:h-48 xl:w-48 2xl:h-64 2xl:w-64 object-contain mr-2.5"
                    src="./img/playstore.png"
                    alt="playstore"
                  />
                </a>
              </div>

              <div className="flex flex-col">
                <a href="#">
                  <img
                    className="h-32 w-32 xl:h-48 xl:w-48 2xl:h-64 2xl:w-64 object-contain"
                    src="./img/appstore.svg"
                    alt="appstore"
                  />
                </a>
              </div>
            </div>
          </div>
        </div>

        <div className="flex items-center justify-center w-full lg:w-1/2">
          <div className="">
            <Image
              src={heroImg}
              width="616"
              height="617"
              alt="Hero Illustration"
              layout="intrinsic"
              loading="lazy"
              placeholder="blur"
            />
          </div>
        </div>
      </Container>
    </>
  );
}
