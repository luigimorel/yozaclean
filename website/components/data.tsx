import {
  AdjustmentsIcon,
  ChartSquareBarIcon,
  CursorClickIcon,
  DeviceMobileIcon,
  EmojiHappyIcon,
  SunIcon,
} from '@heroicons/react/outline';

import benefitTwoImg from '../public/img/cleaning.svg';
import benefitOneImg from '../public/img/cleaning1.svg';

const benefitOne = {
  title: 'Benefits',
  desc: 'With YozaClean, you can rest assured that your home or office will be spotless in no time. Try us out today and see the difference for yourself! With YozaClean, you can be sure that your home or office will be spotless in no time.',
  image: benefitOneImg,
  bullets: [
    {
      title: 'Deligent service',
      desc: 'We strive to offer excellent service to all our customers.',
      icon: <EmojiHappyIcon />,
    },
    {
      title: 'Guaranteed satsifaction',
      desc: 'Customer satsifaction is our strength.',
      icon: <ChartSquareBarIcon />,
    },
    {
      title: 'Expertise',
      desc: 'We strive to have the best cleaners on our platform.',
      icon: <CursorClickIcon />,
    },
  ],
};

const benefitTwo = {
  title: 'Offer more benefits here',
  desc: 'You can use this same layout with a flip image to highlight your rest of the benefits of your product. It can also contain an image or Illustration as above section along with some bullet points.',
  image: benefitTwoImg,
  bullets: [
    {
      title: 'Mobile Responsive Template',
      desc: 'YozaClean is designed as a mobile first responsive template.',
      icon: <DeviceMobileIcon />,
    },
    {
      title: 'Powered by Next.js & TailwindCSS',
      desc: 'This template is powered by latest technologies and tools.',
      icon: <AdjustmentsIcon />,
    },
    {
      title: 'Dark & Light Mode',
      desc: 'YozaClean comes with a zero-config light & dark mode. ',
      icon: <SunIcon />,
    },
  ],
};

export { benefitOne, benefitTwo };
