import Head from 'next/head';

import Benefits from '../components/benefits';
import { benefitOne } from '../components/data';
import Faq from '../components/faq';
import Footer from '../components/footer';
import Hero from '../components/hero';
import Navbar from '../components/navbar';
import SectionTitle from '../components/sectionTitle';
import Video from '../components/video';

export default function Home() {
  return (
    <>
      <Head>
        <title>
          YozaClean - Get all your cleaning done with a tap of a button
        </title>
        <meta
          name="description"
          content="YozaClean - Get all your cleaning done with a tap of a button"
        />
        <link rel="icon" href="/favicon.ico" />
      </Head>

      <Navbar />
      <Hero />
      <div id="why">
        <SectionTitle
          pretitle="YozaClean Benefits"
          title=" Why should you use YozaClean">
          {/* YozaClean is a sanitation company that aims to connect businesses to
        clients through leveraging technology.*/}{' '}
          YozaClean is the ultimate solution for connecting cleaning businesses
          to customers. Whether you're a busy professional or a busy parent, we
          make it easy to find and book top-rated cleaning services in your
          area.{' '}
        </SectionTitle>
        <Benefits data={benefitOne} />
      </div>

      {/* <Benefits imgPos="right" data={benefitTwo} /> */}

      <div id="how">
        <SectionTitle
          pretitle="Watch a video"
          title="Learn how YozaClean works">
          Let's show you how we work to solve your cleaning needs.
        </SectionTitle>
        <Video />
      </div>

      <div id="faq">
        <SectionTitle pretitle="FAQ" title="Frequently Asked Questions">
          Got any unanswered questions? We've got some answers for you.
        </SectionTitle>
        <Faq />
      </div>
      <Footer />
      {/* <PopupWidget /> */}
    </>
  );
}
